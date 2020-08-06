module NatureRemoApi
  module Endpoints
    module User
      def user_me
        get('/1/users/me')
      end

      def update_user_me(nickname:)
        params = {
          nickname: nickname
        }

        post('/1/users/me', params)
      end
    end
  end
end