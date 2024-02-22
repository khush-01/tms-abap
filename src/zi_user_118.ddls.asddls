@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for User'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_USER_118
  as select from zdt_user_118
  association [1..1] to zdt_user_118 as _rep  on $projection.RepTo = _rep.ein
  association [1..1] to ZSH_DEPT_118 as _dept on $projection.Dept = _dept.Value
  association [1..1] to ZSH_TEAM_118 as _team on $projection.Team = _team.Value
{
  key ein                as Ein,
      emp_name           as EmpName,
      dept               as Dept,
      _dept.Description  as DeptDesc,
      team               as Team,
      _team.Description  as TeamDesc,
      rep_to             as RepTo,
      _rep.emp_name      as RepName,
      user_id            as UserId,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat as LocalLastChangedAt,

      _rep,
      _dept,
      _team
}
