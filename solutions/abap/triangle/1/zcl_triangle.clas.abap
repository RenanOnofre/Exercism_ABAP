CLASS zcl_triangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid,

      is_isosceles
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid,

      is_scalene
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid.

  PRIVATE SECTION.
    METHODS validate_triangle
      IMPORTING
        side_a TYPE f
        side_b TYPE f
        side_c TYPE f
      RAISING
        cx_parameter_invalid.

ENDCLASS.


CLASS zcl_triangle IMPLEMENTATION.

  METHOD validate_triangle.
    " Lados devem ser positivos
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    " Desigualdade triangular (estrita: não aceita degenerado)
    IF side_a + side_b <= side_c
    OR side_a + side_c <= side_b
    OR side_b + side_c <= side_a.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.

  METHOD is_equilateral.
    CALL METHOD validate_triangle
      EXPORTING
        side_a = side_a
        side_b = side_b
        side_c = side_c.

    IF side_a = side_b AND side_a = side_c.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD is_isosceles.
    CALL METHOD validate_triangle
      EXPORTING
        side_a = side_a
        side_b = side_b
        side_c = side_c.

    IF side_a = side_b OR side_a = side_c OR side_b = side_c.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD is_scalene.
    CALL METHOD validate_triangle
      EXPORTING
        side_a = side_a
        side_b = side_b
        side_c = side_c.

    IF side_a <> side_b AND side_a <> side_c AND side_b <> side_c.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.