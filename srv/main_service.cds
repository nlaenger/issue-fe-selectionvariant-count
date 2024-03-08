using {com.dscgmbh.poc.replace_me as db} from '../db/_replace_me';


service main_service {

  entity Belege          as projection on db.Belege;
  entity Positionen      as projection on db.Belege.items;
  entity Arbeitsschritte as projection on db.Belege.items.steps;

  @cds.persistence.exists
  @odata.singleton
  entity UIHelper {
    IsViewClusterAvailable : Boolean;
  }
};
