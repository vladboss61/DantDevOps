def first_or_default(iterable, condition=lambda x: True, default=None):
    return next((x for x in iterable if condition(x)), default)