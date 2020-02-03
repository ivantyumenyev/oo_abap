CLASS zcl_notif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      tv_notif_id TYPE n LENGTH 10,
      BEGIN OF ts_notification,
        notif_id    TYPE tv_notif_id,
        type        TYPE string,
        description TYPE string,
      END OF ts_notification.

    METHODS:
      constructor
        IMPORTING
          iv_notif_id     TYPE tv_notif_id OPTIONAL
          is_notification TYPE ts_notification OPTIONAL,

      read RETURNING VALUE(ro_notif) TYPE REF TO zcl_notif,
      get_notification RETURNING VALUE(rs_notification) TYPE REF TO ts_notification,
      is_created RETURNING VALUE(rv_created) TYPE abap_bool,
      generate_id,
      save RETURNING VALUE(ro_notif) TYPE REF TO zcl_notif.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      ms_notification TYPE REF TO ts_notification.
ENDCLASS.

CLASS zcl_notif IMPLEMENTATION.
  METHOD constructor.
    IF iv_notif_id IS SUPPLIED.
      ms_notification = NEW #( notif_id = iv_notif_id ).
    ELSEIF is_notification IS SUPPLIED.
      ms_notification = NEW #( is_notification ).
    ELSE.
*    error
    ENDIF.
  ENDMETHOD.

  METHOD read.
*  Read data from Database by notification ID
    ms_notification->type = |Z1|.
    ms_notification->description =
        |Notification { ms_notification->notif_id } description|.

    ro_notif = me.
  ENDMETHOD.

  METHOD get_notification.
    rs_notification = ms_notification.
  ENDMETHOD.

  METHOD is_created.
    rv_created = xsdbool( ms_notification->notif_id IS NOT INITIAL ).
  ENDMETHOD.

  METHOD save.
*    Save notification to Database

    ro_notif = me.
  ENDMETHOD.

  METHOD generate_id.
    ms_notification->notif_id = |{ cl_abap_random_int=>create(
        min = 1 max = 999999 )->get_next( ) WIDTH = 10 }|.
  ENDMETHOD.
ENDCLASS.
