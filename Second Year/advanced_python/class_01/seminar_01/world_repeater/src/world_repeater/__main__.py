import argparse

def parse_args(args: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("word", help="the word to be repeated", metavar="WORD")
    parser.add_argument("-l", "--limit", default=3, help="the limit on the number of words",
                        metavar="N", type=int)
    return parser.parse_args(args)

def main(argv: list[str] | None = None) -> None:
    args = parse_args(argv)
    for _ in range(args.limit):
        print(args.word)

if __name__ == "__main__":
    main()