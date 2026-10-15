/* Halt, Cli, Sti in C */

void cli(void) {
    __asm__ __volatile__("cli");
}

void sti(void) {
    __asm__ __volatile__("sti");
}

void halt(void) {
    __asm__ __volatile__("hlt");
}
