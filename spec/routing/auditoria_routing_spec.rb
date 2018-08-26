require 'spec_helper'

RSpec.describe AuditoriaController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/auditoria').to route_to('auditoria#index')
    end

    it 'routes to #new' do
      expect(get: '/auditoria/new').to route_to('auditoria#new')
    end

    it 'routes to #show' do
      expect(get: '/auditoria/1').to route_to('auditoria#show', id: 1)
    end

    it 'routes to #edit' do
      expect(get: '/auditoria/1/edit').to route_to('auditoria#edit', id: 1)
    end

    it 'routes to #create' do
      expect(post: '/auditoria').to route_to('auditoria#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/auditoria/1').to route_to('auditoria#update', id: 1)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/auditoria/1').to route_to('auditoria#update', id: 1)
    end

    it 'routes to #destroy' do
      expect(delete: '/auditoria/1').to route_to('auditoria#destroy', id: 1)
    end
  end
end
