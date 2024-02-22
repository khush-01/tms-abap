@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search Help for Team'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSH_TEAM_118
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDO_TEAM_118' )
{
  @UI.hidden: true
  key domain_name    as DomName,
  @UI.hidden: true
  key value_position as ValPos,
  @UI.hidden: true
  key language       as Language,
      value_low      as Value,
      text           as Description
}
