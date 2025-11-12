%%%%%%%%%%%%%%%%%%%%%%%%
% Window
%%%%%%%%%%%%%%%%%%%%%%%%
elem(w, window, root).
    attr(w, child_layout, flex).
    attr(w, flex_direction, column).

%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%
%table%
%%%%%%%%%%%%%%%%%%%%%%%%
%
elem(p,container, w).
    attr(p, child_layout,grid).
    attr(p, flex_direction, row).
    attr(p, display, block).
    attr(p, margin, auto).

%row for the attributes   
elem(attr_name(A), label, p):- attribute(A).
    attr(attr_name(A), grid_row, 0) :- attribute(A).
    attr(attr_name(A), grid_column, N+3) :- att_n(N,A).
    attr(attr_name(A), label, A) :- attribute(A).

%column for the exmples
elem(ex(E), label, p):- example(E,_).
    attr(ex(E), grid_row, E+1) :- example(E,_).
    attr(ex(E), grid_column, 0) :- example(E,_).
    attr(ex(E), label, E) :- example(E,_).


    