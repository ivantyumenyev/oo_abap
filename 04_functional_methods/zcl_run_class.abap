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
*    DATA(lo_notif) = NEW zcl_notif( |1234567890| ).
*    out->write( lo_notif->get_notification_id( ) ).
*
*    lo_notif->read( ).
*    DATA(ls_notification) = lo_notif->get_notification( ).
*    out->write( ls_notification->description ).
*
*    lo_notif->set_description( |New description| ).
**    ls_notification = lo_notif->get_notification( ).
*    out->write( ls_notification->description ).

    DATA(ls_notification) = NEW zcl_notif( |1234567890| )->read(
        )->set_description( |New description| )->get_notification(  ).

    out->write( ls_notification->description ).

  ENDMETHOD.
ENDCLASS.
