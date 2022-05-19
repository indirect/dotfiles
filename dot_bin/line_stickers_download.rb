#!/usr/bin/env ruby

require "fileutils"
require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "http", "~> 4.4"
  gem "oga", "~> 3.2"
  gem "pry"
end

input = ARGV.first
html = HTTP.get(input).to_s
page = Oga.parse_html(html)

pack_name = page.css("title").text.split(" – ").first
FileUtils.mkdir_p pack_name
Dir.chdir pack_name

main_sticker = page.css('[data-widget="MainSticker"]').first
preview = JSON.parse(main_sticker.attribute("data-preview").value)
File.write("main.png", HTTP.get(preview["staticUrl"]).to_s)

page.css("li.FnStickerPreviewItem").each do |li|
  preview = JSON.parse(li.attribute("data-preview").value)
  type = preview.fetch("type").split("_").first
  image_url = preview.fetch("#{type}Url").gsub(";compress=true", "")
  sticker_id = image_url.split("/")[6]

  png = HTTP.get(image_url).to_s
  File.write("#{sticker_id}.png", png)
end
