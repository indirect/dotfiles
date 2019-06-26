hyper = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}
col = hs.drawing.color.x11

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

hs.window.animationDuration = 0.0
-- https://github.com/matthewfallshaw/miro-windows-manager/
Install:andUse("MiroWindowsManager", {
  hotkeys = {
    up          = {hyper, "Up"},
    right       = {hyper, "Right"},
    down        = {hyper, "Down"},
    left        = {hyper, "Left"},
    fullscreen  = {hyper, "M"},
    center      = {hyper, "C"},
    move        = {hyper, "'"},
    resize      = {hyper, "A" }
  }
})

Install:andUse("WindowScreenLeftAndRight", {
  hotkeys = {
    screen_left = { shift_hyper, "Left" },
    screen_right = { shift_hyper, "Right" },
  }
})

-- Install:andUse("ToggleScreenRotation", {
--   hotkeys = { first = {hyper, "f15"} }
-- })

-- Install:andUse("SendToOmniFocus", {
--                  config = {
--                    quickentrydialog = false,
--                    notifications = false
--                  },
--                  hotkeys = {
--                    send_to_omnifocus = { hyper, "t" }
--                  },
--                  fn = function(s)
--                    s:registerApplication("Swisscom Collab", { apptype = "chromeapp", itemname = "tab" })
--                    s:registerApplication("Swisscom Wiki", { apptype = "chromeapp", itemname = "wiki page" })
--                    s:registerApplication("Swisscom Jira", { apptype = "chromeapp", itemname = "issue" })
--                    s:registerApplication("Brave Browser Dev", { apptype = "chromeapp", itemname = "page" })
--                  end
--                }
-- )

clear = {
    alpha = 0,
    blue = 0,
    green = 0,
    red = 0
}

Install:andUse("MenubarFlag",
               {
                 config = {
                   colors = {
                     ["U.S."] = { },
                     Hiragana = {col.red, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear},
                     Dvorak = {col.black, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear, clear},
                   },
                   indicatorAlpha = 0.7,
                   indicatorHeight = 0.05
                 },
                 start = true
               }
)

-- Install:andUse("KSheet",
--                {
--                  hotkeys = {
--                    toggle = { hyper, "/" }
-- }})

-- Install:andUse("TimeMachineProgress",
--                {
--                  start = true
--                }
-- )

-- local wm=hs.webview.windowMasks
-- Install:andUse("PopupTranslateSelection",
--                {
--                  disable = true,
--                  config = {
--                    popup_style = wm.utility|wm.HUD|wm.titled|wm.closable|wm.resizable,
--                  },
--                  hotkeys = {
--                    translate_to_en = { hyper, "e" },
--                    translate_to_jp = { hyper, "j" },
--                  }
--                }
-- )

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
