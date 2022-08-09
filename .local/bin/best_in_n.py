#!/usr/bin/env python3

import argparse
import subprocess
import time

from typing import Sequence
from typing import Optional

def run_cli(args: Optional[Sequence[str]] = None) -> int:
    parser = argparse.ArgumentParser(
        description='run a command n times and output the fastest run-time',
    )
    parser.add_argument(
        '-r',
        '--repeat',
        metavar='N',
        type=int,
        default=10,
        help='how many times to run command (default: 10)',
    )
    parser.add_argument(
        'command',
        metavar='CMD',
        nargs='+',
        help='an integer for the accumulator',
    )
    args = parser.parse_args()
    best: Optional[float] = None
    for _ in range(args.repeat):
        start = time.monotonic()
        c_process = subprocess.run(
            args.command,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        )
        print('.', end='', flush=True)
        if c_process.returncode != 0:
            print(
                '\nAn error was encountered and sub-process exited with code '
                f'{c_process.returncode}\nOutput:\n{c_process.stdout}'
            )
            return 1
        end = time.monotonic()
        run_time = end - start
        if best is None or run_time < best:
            best = run_time
    print(f'\nbest time was: {best:.06f}s')
    return 0

if __name__ == '__main__':
    raise SystemExit(run_cli())
