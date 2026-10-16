# SDL3 with Zig

Basic settings to run SDL3 using Zig.

A minimal native example written in Zig using `@cImport` for SDL3. It opens an
800×600 resizable window, polls for quit events, clears to a blue-gray background,
and draws a gray rectangle. This is a build/C-interop experiment, not a game.
Close the window to quit.

## Build and run

`build.zig.zon` declares minimum Zig **0.14.0** and pins the
[castholm/SDL](https://github.com/castholm/SDL) dependency at
`dbb1b96360658f5845ff6fac380c4f13d7276dc2` (package hash identifies
`sdl-0.2.0+3.2.8`). The build links that dependency's `SDL3` artifact; it does not
ask for a separately installed system SDL. Use a compatible Zig toolchain and
the dependency's native platform prerequisites. Running needs desktop graphics;
the source requests `SDL_WINDOW_VULKAN` as well as `SDL_WINDOW_RESIZABLE`.

From the repository root, the build file defines:

```sh
zig build
zig build run
```

**Manifest caveat:** `.paths` currently contains only `"invalid"`, which does not
match the source/build paths in the repository. Check this package-path setting
before relying on package distribution or a clean-checkout build. This is a
static-source concern, not a reproduced build failure. The commands above follow
the declared install/run steps; they have not been executed for this documentation.
No test step is defined.

## Source and related example

- `src/main.zig`: SDL C imports, window, event loop, and rectangle rendering.
- `build.zig`: executable `sdl3_zig`, SDL dependency linkage, and `run` step.
- `build.zig.zon`: Zig minimum and pinned SDL package.

[sdl3_zig_c](https://github.com/jpetracci/sdl3_zig_c) is the comparable C-source
variant built with Zig. Neither example implements a larger game framework.
