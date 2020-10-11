require 'rails_helper'

RSpec.describe 'admin panel routing', :aggregate_failures, type: :routing do
  it 'routes root to boards index action' do
    expect(get: '/admin').to route_to(
      controller: 'admin/boards', action: 'index')
  end
  
  it 'routes boards' do
    expect(get: '/admin/boards').to route_to(
      controller: 'admin/boards', action: 'index'
    )
    expect(get: '/admin/boards/1').to route_to(
      controller: 'admin/boards', action: 'show', id: '1'
    )
    expect(get: '/admin/boards/new').to route_to(
      controller: 'admin/boards', action: 'new'
    )
    expect(get: '/admin/boards/1/edit').to route_to(
      controller: 'admin/boards', action: 'edit', id: '1'
    )
    expect(post: '/admin/boards').to route_to(
      controller: 'admin/boards', action: 'create'
    )
    expect(patch: '/admin/boards/1').to route_to(
      controller: 'admin/boards', action: 'update', id: '1'
    )
    expect(delete: '/admin/boards/1').to route_to(
      controller: 'admin/boards', action: 'destroy', id: '1'
    )
  end

  it 'routes comments' do
    expect(get: '/admin/comments').to route_to(
      controller: 'admin/comments', action: 'index'
    )
    expect(get: '/admin/comments/1').to route_to(
      controller: 'admin/comments', action: 'show', id: '1'
    )
    expect(get: '/admin/comments/new').to route_to(
      controller: 'admin/comments', action: 'new'
    )
    expect(get: '/admin/comments/1/edit').to route_to(
      controller: 'admin/comments', action: 'edit', id: '1'
    )
    expect(post: '/admin/comments').to route_to(
      controller: 'admin/comments', action: 'create'
    )
    expect(patch: '/admin/comments/1').to route_to(
      controller: 'admin/comments', action: 'update', id: '1'
    )
    expect(delete: '/admin/comments/1').to route_to(
      controller: 'admin/comments', action: 'destroy', id: '1'
    )
  end

  it 'routes posts' do
    expect(get: '/admin/posts').to route_to(
      controller: 'admin/posts', action: 'index'
    )
    expect(get: '/admin/posts/1').to route_to(
      controller: 'admin/posts', action: 'show', id: '1'
    )
    expect(get: '/admin/posts/new').to route_to(
      controller: 'admin/posts', action: 'new'
    )
    expect(get: '/admin/posts/1/edit').to route_to(
      controller: 'admin/posts', action: 'edit', id: '1'
    )
    expect(post: '/admin/posts').to route_to(
      controller: 'admin/posts', action: 'create'
    )
    expect(patch: '/admin/posts/1').to route_to(
      controller: 'admin/posts', action: 'update', id: '1'
    )
    expect(delete: '/admin/posts/1').to route_to(
      controller: 'admin/posts', action: 'destroy', id: '1'
    )
  end

  it 'routes post statuses' do
    expect(get: '/admin/post_statuses').to route_to(
      controller: 'admin/post_statuses', action: 'index'
    )
    expect(get: '/admin/post_statuses/1').to route_to(
      controller: 'admin/post_statuses', action: 'show', id: '1'
    )
    expect(get: '/admin/post_statuses/new').to route_to(
      controller: 'admin/post_statuses', action: 'new'
    )
    expect(get: '/admin/post_statuses/1/edit').to route_to(
      controller: 'admin/post_statuses', action: 'edit', id: '1'
    )
    expect(post: '/admin/post_statuses').to route_to(
      controller: 'admin/post_statuses', action: 'create'
    )
    expect(patch: '/admin/post_statuses/1').to route_to(
      controller: 'admin/post_statuses', action: 'update', id: '1'
    )
    expect(delete: '/admin/post_statuses/1').to route_to(
      controller: 'admin/post_statuses', action: 'destroy', id: '1'
    )
  end

  it 'routes users' do
    expect(get: '/admin/users').to route_to(
      controller: 'admin/users', action: 'index'
    )
    expect(get: '/admin/users/1').to route_to(
      controller: 'admin/users', action: 'show', id: '1'
    )
    expect(get: '/admin/users/new').to route_to(
      controller: 'admin/users', action: 'new'
    )
    expect(get: '/admin/users/1/edit').to route_to(
      controller: 'admin/users', action: 'edit', id: '1'
    )
    expect(post: '/admin/users').to route_to(
      controller: 'admin/users', action: 'create'
    )
    expect(patch: '/admin/users/1').to route_to(
      controller: 'admin/users', action: 'update', id: '1'
    )
    expect(delete: '/admin/users/1').to route_to(
      controller: 'admin/users', action: 'destroy', id: '1'
    )
  end
end