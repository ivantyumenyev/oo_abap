CLASS zcl_run_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_run_class IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_notif) = NEW zcl_notif( |1234567890| ).
    out->write( lo_notif->mv_notif_id ).
  ENDMETHOD.
ENDCLASS.
