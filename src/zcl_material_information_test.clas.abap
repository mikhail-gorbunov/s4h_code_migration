CLASS zcl_material_information_TEST DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE matnr
      RETURNING
        VALUE(material_art) TYPE mtart.
ENDCLASS.



CLASS ZCL_MATERIAL_INFORMATION_TEST IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE mara.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE boole_d.

    production_date = sy-datum.

    SELECT SINGLE mtart FROM mara INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

    MOVE material-mtart TO material_art.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_test.
    material_info = NEW #(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.
