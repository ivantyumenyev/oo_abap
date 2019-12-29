CLASS zcl_notif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      tv_notif_id TYPE n LENGTH 10,
      BEGIN OF ts_notification,
        notif_id TYPE tv_notif_id,
        type TYPE string,
        description TYPE string,
      END OF ts_notification.

    METHODS:
      constructor IMPORTING iv_notif_id TYPE tv_notif_id,
      get_notification_id RETURNING VALUE(rv_notif_id) TYPE tv_notif_id.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      ms_notification TYPE REF TO ts_notification.
ENDCLASS.

CLASS zcl_notif IMPLEMENTATION.
  METHOD constructor.
    ms_notification = NEW #(  ).
    ms_notification->notif_id = iv_notif_id.
  ENDMETHOD.

  METHOD get_notification_id.
    rv_notif_id = ms_notification->notif_id.
  ENDMETHOD.
ENDCLASS.
