source ~/.peda/peda.py

set disassembly-flavor intel
set disable-randomization off
set pagination off
set follow-fork-mode child
set print pretty on

# History
set history filename ~/.gdbhistory
set history save
set history expansion

# Output format
set output-radix 0x1

