@EndUserText.label: 'Consumption View for User'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
define root view entity ZC_USER_118
  provider contract transactional_query
  as projection on ZI_USER_118
{
      @EndUserText.label: 'Employee ID'
  key Ein,
      EmpName,
//      @ObjectModel.text.element: [ 'DeptDesc' ]
      Dept,
      DeptDesc,
//      @ObjectModel.text.element: [ 'TeamDesc' ]
      Team,
      TeamDesc,
      @ObjectModel.text.element: [ 'RepName' ]
      RepTo,
      RepName,
      UserId,
      LocalLastChangedAt,

      /* Associations */
      _dept,
      _rep,
      _team
}
