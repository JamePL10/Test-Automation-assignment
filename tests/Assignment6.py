"""
6) A simple cipher built on the alphabet wheel [A-Z] (uppercase).
   Given encrypted string of only A-Z, decrypt by shifting k steps
   COUNTERCLOCKWISE (i.e. go backward k) around the wheel.

Example:
 encrypted = 'VTAOG'
 k=2
 => 'TRYME'
"""
def simpleCipher(encrypted: str, k: int) -> str:
    decrypted = []
    k = k % 26  # Handle large k values

    for char in encrypted:
        # Convert character to 0–25 index
        index = ord(char) - ord('A')
        
        # Move counter-clockwise (backward)
        new_index = (index - k) % 26
        
        # Convert back to character
        decrypted.append(chr(new_index + ord('A')))

    return ''.join(decrypted)
