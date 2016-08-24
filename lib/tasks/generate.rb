namespace :yeoman do
  desc 'Expire accreditations over 90 days'
  task :generate_angular_crud_pages => :environment do
    tmp = []
    tables = ActiveRecord::Base.connection.tables
    tables.each do |table|
      next if ['tmp_investment_term', 'version', 'msd_profile'].include?(table.singularize.to_s)
      tmp_result = [table.singularize.to_s]
      table_class = table.singularize.camelize.constantize rescue next
      # WIP
      tmp_required_columns = []
      table_class.validators.each do |validator|
        next unless validator.is_a?(ActiveRecord::Validations::PresenceValidator)
        validator.attributes.each do |column|
          tmp_required_columns << column
        end
        tmp_required_columns.uniq.compact
      end
      # binding.pry
      table_columns = table_class.columns.map(&:name)
      tmp_table_columns = table_columns.reject{|asdf|
        true if (asdf =~ /audit_/ || asdf.eql?('account_id'))
      }
      tmp_result << tmp_table_columns.compact.join(' ')
      # Put column name w/ class type
      tmp_form_columns = table_class.columns.collect{|x|
        if !(x.name =~ /audit_/ || x.name.eql?('id'))
          tmp_final_column = ''
          if x.sql_type.eql?('timestamp without time zone')
            tmp_final_column = tmp_final_column + x.name + ':timestamp'
          elsif x.sql_type.include?('character varying')
            tmp_final_column = tmp_final_column + x.name + ':character'
          elsif x.sql_type.include?('double precision')
            tmp_final_column = tmp_final_column + x.name + ':character'
          else
            tmp_final_column = tmp_final_column + x.name + ':' + x.sql_type
          end
          if tmp_required_columns.include?(x.name.to_sym)
            tmp_final_column = tmp_final_column + ':required'
          end
          tmp_final_column
        end
      }
      # binding.pry if table.eql?('postal_addresses')
      tmp_result << tmp_form_columns.compact.join(' ')
      tmp_reflections = table.classify.constantize.reflections.keys
      if (['email_address', 'phone_number', 'postal_address'] & tmp_reflections).any?
        tmp_params = ''
        tmp_params << '-'
        tmp_params << 'e' if tmp_reflections.include?('email_address')
        tmp_params << 'p' if tmp_reflections.include?('phone_number')
        tmp_params << 'a' if tmp_reflections.include?('postal_address')
        tmp_params << 'b' if tmp_reflections.include?('bank_account')
        tmp_result << tmp_params
      end
      puts tmp_result
      tmp << tmp_result
    end

    File.open('yeoman_generators.md', 'w') do |file|
      tmp.each do |class_generator|
        # file.write('```' + "\r\n" + class_generator[0].strip + ' "' + class_generator[1].strip + '" "' + class_generator[2].strip + '"' + "\r\n" + '```' + "\r\n")
        tmp_output = "\r\nyo ims-v-5 " + class_generator[0].strip + ' "' + class_generator[1].strip + '" "' + class_generator[2].strip + '" '
        tmp_output << class_generator[3].strip if class_generator[3].present?
        file.write(tmp_output)
      end
    end
  end
end