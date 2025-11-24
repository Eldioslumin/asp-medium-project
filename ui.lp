%%%%%%%%%%%%%%%%%%%%%%%%
% Option constants
%%%%%%%%%%%%%%%%%%%%%%%%


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
    attr(p, class, ("bg-light")).

%row for attribute names that are also checkboxes for including/excluding attributes
elem(attr_name(A), checkbox, p):- attribute(A).
    attr(attr_name(A), grid_row, 1) :- attribute(A).
    attr(attr_name(A), grid_column, N+2) :- att_n(N,A).
    attr(attr_name(A), label, A) :- attribute(A).
    %styling
    attr(attr_name(A), class, ("fw-bold")) :- attribute(A).
    attr(attr_name(A), class, ("text-center")) :- attribute(A).
    
    

%column for the examples
elem(ex(E), label, p):- example(E,_).
    attr(ex(E), grid_row, E+1) :- example(E,_).
    attr(ex(E), grid_column, 0) :- example(E,_).
    attr(ex(E), label, E) :- example(E,_).
    attr(ex(E), class, ("fw-bold")) :- example(E,_).
    attr(ex(E), class, ("px-1")) :- example(E,_).

%column to show pos/neg label of example
elem(ex(E, V), label, p) :- example(E, V).
    attr(ex(E, V), label, V) :- example(E, V).
    attr(ex(E, V), grid_column, 1) :- example(E,V). 
    attr(ex(E, V), grid_row, E+1) :- example(E,V). 
    attr(ex(E, V), class, ("border-end")) :- example(E, V).
    attr(ex(E, V), class, ("px-1")) :- example(E, V).

%cells to show whether an example has an attribute
elem(cell(E,A), label, p) :- example(E,_), attribute(A).
    attr(cell(E,A), grid_row, E+1) :- example(E,_), attribute(A).
    attr(cell(E,A), grid_column, N+2) :- att_n(N,A), example(E,_), attribute(A).
    attr(cell(E,A), label, "X") :- has(E,A), example(E,_), attribute(A).
    attr(cell(E,A), label, "") :- not has(E,A), example(E,_), attribute(A).
    attr(cell(E,A), class, ("text-center")) :- example(E,_), attribute(A).


%column to show whether an example is correctly classified
elem(ex(E, result), label, p) :- example(E,_).
    attr(ex(E, result), label, "Result") :- example(E,_).
    attr(ex(E, result), grid_column, ATT_N + 3) :- example(E,_), ATT_N = #count { 0,A : attribute(A) }.
    attr(ex(E, result), grid_row, 0) :- example(E,_).
    attr(ex(E, result), class, ("border-start","fw-bold")) :- example(E,_).
    attr(ex(E, result), class, ("px-1")) :- example(E,_).
    %for each example, show whether it is classified correctly or not
    attr(ex(E, result), label, "Correct") :- classified(E, correct), example(E,_).
    attr(ex(E, result), label, "Incorrect") :- classified(E, incorrect), example(E,_).
    attr(ex(E, result), class, ("bg-opacity-75")) :- classified(E, correct), example(E,_).
    attr(ex(E, result), class, ("bg-danger")) :- classified(E, incorrect), example(E,_).    

% elem(ex(E,R), label, p) :- result(E,R).
%     attr(ex(E,R), label, "Result") :- result(E,R).
%     attr(ex(E,R), grid_row, E+1) :- result(E,R).
%     attr(ex(E,R), grid_column, ATT_N + 3) :- result(E,R), ATT_N = #count { 0,A : attribute(A) }.
%     attr(ex(E,R), label, "Correct") :- result(E,R), true(1,E).
%     attr(ex(E,R), label, "Incorrect") :- result(E,R), not true(1,E).

%container for the graph
elem(graph_container, container, w).
    elem(graph, canvas, graph_container).
        attr(graph, image_type, clingraph).
        
