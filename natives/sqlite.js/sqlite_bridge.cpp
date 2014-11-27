/*
 *
 * SQLite JS bridge
 * (C) 2014 Ledger
 *
 */

#include "sqlite_bridge.h"

SqliteBridgeInstance::SqliteBridgeInstance(PP_Instance instance) : pp::Instance(instance)
{

}

bool SqliteBridgeInstance::Init(uint32_t /*argc*/, const char * [] /*argn*/, const char * [] /*argv*/)
{
  LogToConsole(PP_LOGLEVEL_LOG, pp::Var("Hello from native"));
  return true;
}

void SqliteBridgeInstance::HandleMessage(const pp::Var& var_message) {
    // Ignore the message if it is not a string.
    if (!var_message.is_string())
      return;

    // Get the string message and compare it to "hello".
    std::string message = var_message.AsString();
     LogToConsole(PP_LOGLEVEL_LOG, pp::Var("Got message from native " + message));
    pp::Var var_reply("Hello World");
    PostMessage(var_reply);
    LogToConsole(PP_LOGLEVEL_LOG, pp::Var(message + " sent"));
}

class Module : public pp::Module {
 public:
  Module() : pp::Module() {}
  virtual ~Module() {}

  virtual pp::Instance* CreateInstance(PP_Instance instance) {
    return new SqliteBridgeInstance(instance);
  }
};

namespace pp {

Module* CreateModule() { return new ::Module(); }

}