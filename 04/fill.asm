// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

  @offset
  M=0

(LOOP)
  @KBD
  D=M

  @BLCK
  D;JGT

  @BLNK
  0;JMP

(BLCK)
  @key
  M=-1

  @COLOR
  0;JMP

(BLNK)
  @key
  M=0

  @COLOR
  0;JMP

(COLOR)
  @SCREEN
  D=A
  @offset
  D=D+M
  @index
  M=D       // Color at the index

  @key
  D=M
  @index
  A=M
  M=D

  @offset
  M=M+1
  D=M
  @8192
  D=A-D
  @CONTINUE
  D;JGT
  @offset
  M=0

(CONTINUE)
  @LOOP
  0;JMP
