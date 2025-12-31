from sources.Application import Telegram_Bot


if __name__ == "__main__":
    print("Telegram Service Running ...")
    service = Telegram_Bot()
    service.run()
