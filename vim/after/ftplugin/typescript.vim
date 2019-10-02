setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']

let g:projectionist_heuristics = {
  \ "tsconfig.json": {
  \   "src/app/*.service.ts": {
  \     "alternate": "src/tests/{}.service.spec.ts",
  \     "related": "src/tests/{}.mock.service.ts",
  \     "type": "service",
  \   },
  \   "src/app/*.mock.service.ts": {
  \     "alternate": "src/app/{}.service.ts",
  \     "type": "mock",
  \   },
  \   "src/tests/*.service.spec.ts": {
  \     "alternate": "src/app/{}.service.ts",
  \     "type": "test",
  \   },
  \   "src/app/*.component.ts": {
  \     "alternate": "src/tests/{dirname}.component.spec.ts",
  \     "type": "component",
  \   },
  \   "src/tests/*.component.spec.ts": {
  \     "alternate": "src/app/{}/{basename}.component.ts",
  \     "type": "test",
  \   },
  \ }}
