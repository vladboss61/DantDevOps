import string

DOUBLE_NEW_LINE = '\n\n'

class Alphabet:

    def __init__(self, lang: str, letters: list[str]):
        self._lang = lang
        self._letters = letters

    def print(self) -> None:
        print('Alphabet')
        for (index, letter) in enumerate(self._letters):
            print(f'Position: {index} | Letter: {letter}')

    def letters_num(self) -> list[str]:
        return len(self._letters)


class EngAlphabet(Alphabet):

    _letters_num: int = 0

    def __init__(self) -> None:
        super().__init__('En', [letter for letter in string.ascii_lowercase])
        EngAlphabet._letters_num = len(string.ascii_lowercase)

    def is_en_letter(self, letter: str) -> bool:
        return letter.lower() in self._letters
    
    def letters_num(self) -> int:
        return EngAlphabet._letters_num
    
    @staticmethod
    def example() -> str:
        return 'example'

if __name__ == '__main__':
    eng = EngAlphabet()

    eng.print()

    print(f'Number of letters: {eng.letters_num()}', end=DOUBLE_NEW_LINE)
    f_letter = eng.is_en_letter('F')
    
    print(f'F in English Alphabet {f_letter}', end=DOUBLE_NEW_LINE)

    broken_letter = eng.is_en_letter('Щ')
    print(f'Щ in English Alphabet {broken_letter}', end=DOUBLE_NEW_LINE)

    print(f'Static call {EngAlphabet.example()}', end=DOUBLE_NEW_LINE)
