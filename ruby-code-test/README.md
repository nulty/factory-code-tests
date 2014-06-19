# Technical Test  

Graphical editors allow users to edit images in the same way text editors let us modify documents. 
Images are represented as an M x N array of pixels with each pixel given colour.

Produce a program that simulates a simple interactive graphical editor.  

## Input

The input consists of a line containing a sequence of commands. Each command is represented by a single capital letter at the start of the line. 
Arguments to the command are separated by spaces and follow the command character.  

Pixel co-ordinates are represented by a pair of integers: 

1. A column number between _1_ and _M_, and 
2. A row number between _1_ and _N_. 

Where _1 <= M_, _N <= 250_. 

The origin sits in the upper-left of the table.  
Colours are specified by capital letters.  

## Commands

The editor supports 7 commands:

1. `I M N`. Create a new _M x N_ image with all pixels coloured white (O).
2. `C`. Clears the table, setting all pixels to white (O).
3. `L X Y C`. Colours the pixel (_X,Y_) with colour _C_.
4. `V X Y1 Y2 C`. Draw a vertical segment of colour _C_ in column X between rows _Y1_ and _Y2_ (inclusive).
5. `H X1 X2 Y C`. Draw a horizontal segment of colour _C_ in row _Y_ between columns _X1_ and _X2_ (inclusive).
6. `F X Y C`. Fill the region _R_ with the colour _C_. _R_ is defined as: Pixel (_X,Y_) belongs to _R_. Any other pixel which is the same colour as (_X,Y_) and shares a common side with any pixel in _R_ also belongs to this region.
7. `S`. Show the contents of the current image
8. `X`. Terminate the session

## Example

In the example below, > denotes input, => denotes program output.

```
> I56 
> L23A 
> S

=>
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO

> F33J 
> V234W 
> H342Z 
> S

=>
JJJJJ
JJZZJ
JWJJJ
JWJJJ
JJJJJ
JJJJJ
```

##￼Submission  

We prefer submissions in Ruby complete with tests using your preferred testing library.  
Please provide an executable solution with any source files in a common archive format (ZIP, RAR, TAR etc.)

￼