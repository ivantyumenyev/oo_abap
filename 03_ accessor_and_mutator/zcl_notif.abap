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
      constructor IMPORTING iv_notif_id TYPE tv_notif_id,
      read,
      get_notification_id RETURNING VALUE(rv_notif_id) TYPE tv_notif_id,
      set_description IMPORTING iv_description TYPE string,
      get_notification RETURNING VALUE(rs_notification) TYPE REF TO ts_notification.
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

  METHOD read.
*  Read data from Database by notification ID
    ms_notification->type = |Z1|.
    ms_notification->description = |Notification { ms_notification->notif_id } description|.
  ENDMETHOD.

  METHOD get_notification_id.
    rv_notif_id = ms_notification->notif_id.
  ENDMETHOD.

  METHOD set_description.
    ms_notification->description = iv_description.
  ENDMETHOD.

  METHOD get_notification.
    rs_notification = ms_notification.
  ENDMETHOD.
ENDCLASS.
