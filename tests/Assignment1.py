"""Check duplicate items from list A and list B and append to a new list. Using your
preferred programming language.
List A : [1,2,3,5,6,8,9]
List B : [3,2,1,5,6,0]"""


def test_find_duplicates():
    list_a = [1, 2, 3, 5, 6, 8, 9]
    list_b = [3, 2, 1, 5, 6, 0]

    duplicates = []

    for item in list_a:
        if item in list_b:
            duplicates.append(item)

    print(f"\nDuplicates found: {duplicates}")
    
    assert all(item in list_b for item in duplicates)
    assert len(duplicates) > 0


