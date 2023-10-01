// Simple hello world

#include <iostream>

int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}

// cowsay
#include <cstdlib>

int main() {
    const char* command = "cowsay Hello, I am a cow!";
    int returnCode = system(command);

    if (returnCode == -1) {
        return 1;
    }

    return 0;
}

// ncurses
#include <ncurses.h>

int main()
{
    // Initialize ncurses
    initscr();
    cbreak();
    noecho();
    keypad(stdscr, TRUE);

    // Print a message
    printw("Hello, ncurses!");

    // Refresh the screen
    refresh();

    // Wait for user input
    getch();

    // Clean up and exit
    endwin();

    return 0;
}
