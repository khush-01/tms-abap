CLASS zcl_api_tms_118 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      tt_mapped_early   TYPE RESPONSE FOR MAPPED EARLY zi_user_118,
      tt_failed_early   TYPE RESPONSE FOR FAILED EARLY zi_user_118,
      tt_reported_early TYPE RESPONSE FOR REPORTED EARLY zi_user_118,
      tt_reported_late  TYPE RESPONSE FOR REPORTED LATE zi_user_118,

      tt_user_keys      TYPE TABLE FOR READ IMPORT zi_user_118\\User,
      tt_user_result    TYPE TABLE FOR READ RESULT zi_user_118\\User,

      tt_user_create    TYPE TABLE FOR CREATE zi_user_118\\User,
      tt_user_update    TYPE TABLE FOR UPDATE zi_user_118\\User,
      tt_user_delete    TYPE TABLE FOR DELETE zi_user_118\\User.

    CLASS-METHODS:
      get_instance
        RETURNING VALUE(ro_obj) TYPE REF TO zcl_api_tms_118.

    METHODS:
      save_data
        CHANGING reported TYPE tt_reported_late,            "TYPE response for reported late zi_user_118

      create_user
        IMPORTING entities TYPE tt_user_create       		"TYPE table for CREATE zi_user_118\\user
        CHANGING  mapped   TYPE tt_mapped_early       		"TYPE response for mapped early zi_user_118
                  failed   TYPE tt_failed_early       		"TYPE response for failed early zi_user_118
                  reported TYPE tt_reported_early,  		"TYPE response for reported early zi_user_118

      read_user
        IMPORTING keys     TYPE tt_user_keys 			    "TYPE table for READ IMPORT zi_user_118\\user
        CHANGING  result   TYPE tt_user_result  		    "TYPE table for READ result zi_user_118\\user
                  failed   TYPE tt_failed_early 			"TYPE response for failed early zi_user_118
                  reported TYPE tt_reported_early, 			"TYPE response for reported early zi_user_118

      update_user
        IMPORTING entities TYPE tt_user_update  			"TYPE table for UPDATE zi_user_118\\user
        CHANGING  mapped   TYPE tt_mapped_early 			"TYPE response for mapped early zi_user_118
                  failed   TYPE tt_failed_early 			"TYPE response for failed early zi_user_118
                  reported TYPE tt_reported_early, 			"TYPE response for reported early zi_user_118

      delete_user
        IMPORTING keys     TYPE tt_user_delete              "TYPE table for DELETE zi_user_118\\user
        CHANGING  mapped   TYPE tt_mapped_early             "TYPE response for mapped early zi_user_118
                  failed   TYPE tt_failed_early             "TYPE response for failed early zi_user_118
                  reported TYPE tt_reported_early.          "TYPE response for reported early zi_user_118



  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA:
      lo_instance TYPE REF TO zcl_api_tms_118,
      lt_users    TYPE STANDARD TABLE OF zdt_user_118,
      lr_users_d  TYPE RANGE OF zdt_user_118-ein.

ENDCLASS.



CLASS ZCL_API_TMS_118 IMPLEMENTATION.


  METHOD get_instance.

    lo_instance = ro_obj = COND #( WHEN lo_instance IS BOUND
                                   THEN lo_instance
                                   ELSE NEW #( ) ).

  ENDMETHOD.


  METHOD save_data.

    IF lt_users IS NOT INITIAL.
      MODIFY zdt_user_118 FROM TABLE @lt_users.
    ENDIF.

    IF lr_users_d IS NOT INITIAL.
      DELETE FROM zdt_user_118 WHERE ein IN @lr_users_d.
    ENDIF.

  ENDMETHOD.


  METHOD create_user.

    lt_users = CORRESPONDING #( entities MAPPING FROM ENTITY ).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entity>).
      IF lt_users IS NOT INITIAL.
        mapped-user = VALUE #( ( %cid 	   = <lfs_entity>-%cid
                                 %key 	   = <lfs_entity>-%key
                                 %is_draft = <lfs_entity>-%is_draft ) ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD read_user.

    SELECT
        FROM zdt_user_118
        FIELDS *
        FOR ALL ENTRIES IN @keys
        WHERE ein = @keys-Ein
        INTO TABLE @DATA(lt_user_data).

    result = CORRESPONDING #( lt_user_data MAPPING TO ENTITY ).

  ENDMETHOD.


  METHOD update_user.

    DATA lt_user_update TYPE STANDARD TABLE OF zdt_user_118.

    lt_user_update = CORRESPONDING #( entities MAPPING FROM ENTITY ).
    IF lt_user_update IS NOT INITIAL.
      lt_users = CORRESPONDING #( lt_user_update ).
    ENDIF.

  ENDMETHOD.


  METHOD delete_user.

    lr_users_d = VALUE #( FOR line IN keys sign = 'I'
                                           option = 'EQ'
                                           ( low = line-Ein ) ).

  ENDMETHOD.
ENDCLASS.
