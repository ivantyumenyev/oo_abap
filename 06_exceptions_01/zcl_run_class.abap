CLASS zcl_run_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      read_notification IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      create_notification
        IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.

CLASS zcl_run_class IMPLEMENTATION.
  METHOD create_notification.
    DATA(lo_notification) = NEW zcl_notif( is_notification =
*        VALUE #( type = |Z1| ) ).
        VALUE #( type = || ) ).

    IF NOT lo_notification->is_created(  ).
      lo_notification->generate_id( ).
    ENDIF.

    TRY.
        DATA(ls_notification) = lo_notification->save( )->read( )->get_notification(  ).
        out->write( ls_notification->description ).
      CATCH zcx_notif INTO DATA(lo_xnotif).
        out->write( |Caugh exception: { lo_xnotif->get_text( ) } |
            && |Message type is { lo_xnotif->if_t100_dyn_msg~msgty }| ).
    ENDTRY.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
*    read_notification( out ).
    create_notification( out ).
  ENDMETHOD.

  METHOD read_notification.
    DATA(ls_notification) = NEW zcl_notif( iv_notif_id = |1234567890|
        )->read( )->get_notification(  ).

    out->write( ls_notification->description ).
  ENDMETHOD.
ENDCLASS.
