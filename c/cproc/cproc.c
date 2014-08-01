#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

void cproc() {
    char *argv[3] = {"sleep", "10s", NULL};
    // the successful call has no process to return to.  If execve() does return to the calling process, an error has occurred;
    // the return value will be -1 and the global variable errno is set to indicate the error.
    if (execv("/bin/sleep", argv) == -1) {
        fprintf(stderr, "error: execve(%d) %s\n", errno, strerror(errno));
    }

    fprintf(stderr, "[panic]I don't expect reach here...; error: execve(%d) %s\n", errno, strerror(errno));
}

int main() {
    pid_t pid = fork();
    if (pid < 0) {
        fprintf(stderr, "error: fork(%d) %s\n", errno, strerror(errno));
        return -1;
    } else if (pid == 0) { // child proc
        cproc();
        _exit(-1);
    } else {               // this proc
        fprintf(stderr, "wait cproc\n");

        // If wait() returns due to a stopped or terminated child process, the process ID of the child is returned to the calling process.
        // Otherwise, a value of -1 is returned and errno is set to indicate the error.
        int status;
        if (waitpid(pid, &status, 0) < 0) {
            fprintf(stderr, "error: waitpid(%d) %s\n", errno, strerror(errno));
            return 1;
        }

        if (WIFEXITED(status)) {
            int s = WEXITSTATUS(status);
            fprintf(stderr, "cproc's status=%04x\n", status);
            return s;
        } else {
            fprintf(stderr, "cproc's status=%04x\n", status);
            return 1;
        }
    }
}
