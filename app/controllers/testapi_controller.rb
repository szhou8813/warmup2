class TestapiController < ApplicationController
    def reset_fixture
       User.destroy_all
       render json: {errCode: User.success.to_s}
    end
end
