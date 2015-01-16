=begin
    To get Rails do something, at minimun, we need to create a 'controller' and a 'view'.

    A controller's purpose is to receive specific requests for the application. Routing decides
    which controller receives which requests. Often there is more than one route to each
    controller, and different routes  can be served by different actions. Each action's purpose
    is to collect information to provide it to a view.

    A view's purpose is to display this information in a human readable form. An important
    distinction is that is the controller, not the view, where information is collected. The view
    should just display that information. By default, view templates are written in a language
    called eRuby (Embedded Ruby) which is processed by the request cycle in Rails before
    being sent to the user.

    To create a new controller, you will need to run the "controller" generator and tell it you
    want a controller called "welcome", with an action called "index". Like this:

                        rails generate controller welcome index

=end

class WelcomeController < ApplicationController
  def index
  end
end
