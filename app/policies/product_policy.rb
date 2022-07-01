class ProductPolicy < BasePolicy
  def edit
    # record.user_id == Current.user.id
    record.owner?
  end

  def update
    record.owner?
  end

  def destroy
    record.owner?
  end
end
