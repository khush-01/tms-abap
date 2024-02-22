CLASS lhc_User DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR User RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE User.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE User.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE User.

    METHODS read FOR READ
      IMPORTING keys FOR READ User RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK User.
    METHODS validateDept FOR VALIDATE ON SAVE
      IMPORTING keys FOR User~validateDept.

    METHODS validateRpto FOR VALIDATE ON SAVE
      IMPORTING keys FOR User~validateRpto.

    METHODS validateTeam FOR VALIDATE ON SAVE
      IMPORTING keys FOR User~validateTeam.

ENDCLASS.

CLASS lhc_User IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

    zcl_api_tms_118=>get_instance( )->create_user(
      EXPORTING
        entities = entities
      CHANGING
        mapped   = mapped
        failed   = failed
        reported = reported
    ).

  ENDMETHOD.

  METHOD update.

    zcl_api_tms_118=>get_instance( )->update_user(
      EXPORTING
        entities = entities
      CHANGING
        mapped   = mapped
        failed   = failed
        reported = reported
    ).

  ENDMETHOD.

  METHOD delete.

    zcl_api_tms_118=>get_instance( )->delete_user(
      EXPORTING
        keys     = keys
      CHANGING
        mapped   = mapped
        failed   = failed
        reported = reported
    ).

  ENDMETHOD.

  METHOD read.

    zcl_api_tms_118=>get_instance( )->read_user(
      EXPORTING
        keys     = keys
      CHANGING
        result   = result
        failed   = failed
        reported = reported
    ).

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD validateDept.
  ENDMETHOD.

  METHOD validateRpto.
  ENDMETHOD.

  METHOD validateTeam.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_USER_118 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_USER_118 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    zcl_api_tms_118=>get_instance( )->save_data(
      CHANGING
        reported = reported
    ).

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
