class InformationProvider < ActiveRecord::Base
	validates :email, presence: true, length: { maximum: 255 },
        			format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

    def self.email_list_for(platform)
    	ips = InformationProvider.where(platform: platform)
    	ip_emails = []
    	ips.each do |i|
    		ip_emails.push(i.email)
    	end
    	return ip_emails.join(",")
    end

end
