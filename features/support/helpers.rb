#Essa arquivo é um support code

module Helpers
  def get_token
    # No google ele faz muito rapido a verificação por isso do loop de 2 seg.
    2.times do
      js_script = 'return window.localStorage.getItem("default_auth_token");'
      page.execute_script(js_script)
      sleep 1
    end
  end
end
