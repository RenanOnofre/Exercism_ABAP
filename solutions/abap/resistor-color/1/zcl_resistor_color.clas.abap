CLASS zcl_resistor_color DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS resistor_color
      IMPORTING
        color_code   TYPE string
      RETURNING
        VALUE(value) TYPE i.
ENDCLASS.

CLASS zcl_resistor_color IMPLEMENTATION.

  METHOD resistor_color.
  DATA(l_color) = to_lower( condense( color_code ) ).
  
  CASE l_color.
        WHEN 'black'.
          value = 0.
        WHEN 'brown'.
          value = 1.
        WHEN 'red'.
          value = 2.
        WHEN 'orange'.
          value = 3.
        WHEN 'yellow'.
          value = 4.
        WHEN 'green'.
          value = 5.
        WHEN 'blue'.
          value = 6.
        WHEN 'violet'.
          value = 7.
        WHEN 'gray'.
          value = 8.
        WHEN 'white'.
          value = 9.
  ENDCASE.
  ENDMETHOD.

ENDCLASS.
