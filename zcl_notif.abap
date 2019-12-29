CLASS zcl_notif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      tv_notif_id TYPE n LENGTH 10.

    DATA:
      mv_notif_id TYPE tv_notif_id.

    METHODS:
      constructor IMPORTING iv_notif_id TYPE tv_notif_id.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_notif IMPLEMENTATION.
  METHOD constructor.
    mv_notif_id = iv_notif_id.
  ENDMETHOD.
ENDCLASS.
