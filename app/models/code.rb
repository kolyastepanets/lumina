class Code < ApplicationRecord
  after_create :destroy_all_codes

  private

  def destroy_all_codes
    Code.delay(run_at: Code.last.created_at + 2.minutes).delete_all
  end
end
