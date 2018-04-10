/* Autogenerated with kurento-module-creator */

#include "FactoryRegistrar.hpp"

#include <SubsenseImplFactory.hpp>
#include <Subsense.hpp>

extern "C" {

  const kurento::FactoryRegistrar *getFactoryRegistrar ();

}

const kurento::FactoryRegistrar *
getFactoryRegistrar ()
{
  static bool loaded = false;
  static std::map<std::string, std::shared_ptr<kurento::Factory>> factories;

  if (!loaded) {
    factories["Subsense"] = std::shared_ptr <kurento::Factory> (new kurento::module::subsense::SubsenseImplFactory() );

    loaded = true;
  }

  static kurento::FactoryRegistrar factory (factories);
  return &factory;
}
