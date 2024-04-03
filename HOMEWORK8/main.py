from random import randint
from enum import Enum

MAX_ATTEMPT = 5

class NumberEquality(Enum):
    Equal = 1
    Low = 2
    Hight = 3

def guess_number(random_number: int, usr_number: int) -> NumberEquality:
    if random_number == usr_number:
        return NumberEquality.Equal
    elif usr_number < random_number:
        return NumberEquality.Low
    else:
        return NumberEquality.Hight

def start() -> None:
    random_number = randint(1, 100)
    attempt = 1

    while attempt <= MAX_ATTEMPT:
        print(f'Your attempt: {attempt}')
        guess = int(input('Your number: '))
        state = guess_number(random_number, guess)
        
        match state:
            case NumberEquality.Equal:
                print('Congratulations! You guessed the right number.')
                break
            case NumberEquality.Low:
                print('Too low')
                attempt = attempt + 1
            case NumberEquality.Hight:
                print('Too high')
                attempt = attempt + 1
            case _:
                print('Something went wrong.')
                break

    if attempt > MAX_ATTEMPT:
        print(f'Sorry, you\'ve run out of attempts. The correct number was [{random_number}]')

if __name__ == '__main__':
    try:
       start()
    except ValueError:
        print('Your input is not the number')