const std = @import("std");

const c = @cImport({
    @cInclude("SDL3/SDL.h");
});

pub fn main() !void {
    _ = c.SDL_SetAppMetadata("sdl3_test", "0.0.0", "sdl_test");
    _ = c.SDL_Init(c.SDL_INIT_VIDEO);
    defer c.SDL_Quit();

    const window_width = 800;
    const window_height = 600;

    const window = c.SDL_CreateWindow("SDL3 Test", window_width, window_height, c.SDL_WINDOW_VULKAN | c.SDL_WINDOW_RESIZABLE);
    defer c.SDL_DestroyWindow(window);
    const renderer = c.SDL_CreateRenderer(window, null);
    defer c.SDL_DestroyRenderer(renderer);

    var running = true;
    var event: c.SDL_Event = undefined;
    const rect: c.SDL_FRect = .{ .x = 50.0, .y = 50.0, .w = 100.0, .h = 100.0 };
    while (running) {
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_QUIT => running = false,
                else => {},
            }
        }

        _ = c.SDL_SetRenderDrawColor(renderer, 50, 50, 100, c.SDL_ALPHA_OPAQUE);
        _ = c.SDL_RenderClear(renderer);
        _ = c.SDL_SetRenderDrawColor(renderer, 100, 100, 100, c.SDL_ALPHA_OPAQUE);
        _ = c.SDL_RenderFillRect(renderer, &rect);
        _ = c.SDL_RenderPresent(renderer);
        c.SDL_Delay(1);
    }
}
