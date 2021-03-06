module AresMUSH
  module Wikidot
    class CharTemplate < ErbTemplateRenderer
      
      attr_accessor :char
      
      def initialize(char)
        @char = char
        super File.dirname(__FILE__) + "/char.erb"
      end
      
      def fullname
        @char.demographic(:fullname)
      end
      
      def gender
        @char.demographic(:gender)
      end
      
      def height
        @char.demographic(:height)
      end
      
      def physique
        @char.demographic(:physique)
      end
      
      def hair
        @char.demographic(:hair)
      end
      
      def eyes
        @char.demographic(:eyes)
      end
      
      def age
        age = @char.age
        age == 0 ? "" : age
      end
      
      def actor
        @char.actor
      end
      
      def birthdate
        dob = @char.demographic(:birthdate)
        !dob ? "" : ICTime.ic_datestr(dob)
      end
      
      def callsign
        @char.demographic(:callsign) || t('profile.none')
      end
      
      def faction
        @char.group("Faction")
      end
      
      def position
        @char.group("Position")
      end
      
      def colony
        @char.group("Colony")
      end
      
      def department
        @char.group("Department")
      end

      def rank
        @char.rank
      end
            
      def background
        @char.background
      end

      def hooks
        @char.fs3_hooks.map { |h| "\n* **#{h.name}** - #{h.description}" }.join
      end
      
      def format_bg(bg)
        colorized = ClientFormatter.format bg
        AnsiFormatter.strip_ansi colorized
      end
    end
  end
end