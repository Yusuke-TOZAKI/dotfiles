from _typeshed import Incomplete

class IndexedList(list[Incomplete]):
    clean: bool
    def __init__(self, iterable: Incomplete | None = None) -> None: ...
    def __contains__(self, value): ...
    def index(self, value): ...
    def append(self, value) -> None: ...
    def add(self, value): ...
