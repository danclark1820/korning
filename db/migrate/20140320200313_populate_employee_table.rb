class PopulateEmployeeTable < ActiveRecord::Migration
  def up
    Sale.find_each do |sale|
      employee_array = sale.employee.split
      if !Employee.exists?(first_name: employee_array[0])
        Employee.create(first_name: employee_array[0], last_name: employee_array[1], email: employee_array[2].scan(/[^()]/).join)
      end
    end
  end

  def down
    Employee.find_each do |employee|
      employee.first_name = nil
      employee.last_name = nil
      employee.email = nil
    end
  end
end

  # create_table "sales", force: true do |t|
  #   t.string   "employee"
  #   t.string   "customer_and_account_no"
  #   t.string   "product_name"
  #   t.date     "sale_date"
  #   t.decimal  "sale_amount"
  #   t.integer  "units_sold"
  #   t.string   "invoice_no"
  #   t.string   "invoice_frequency"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end
