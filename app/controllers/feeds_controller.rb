# -*- coding: utf-8 -*-
class FeedsController < ApplicationController

  # GET /
  def top_page
    @feeds = Feed.page params[:page]
    @tags  = Feed.tag_counts_on(:tags)
    @sites = Site.all

    respond_to do |format|
      format.html { render :top_page, :layout => "feed_index" }# index.html.erb
      format.js
      format.json { render json: @feeds }
    end
  end

  # GET /feeds
  # GET /feeds.json
  def index
    @sites = Site.all
    if params[:site]
      @feeds = Feed.where(:site_id => params[:site]).page params[:page]      
    else
      @feeds = Feed.page params[:page]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @feeds }
    end
  end

  # GET /site_feed?site=<site_id>
  def filter
    @site  = Site.find(params[:site])
    @feeds = Feed.where(site_id).page(params[:page])
    @tags  = Feed.tag_counts_on(:tags)
    @sites = Site.all

    respond_to do |format|
      format.html { render :index, :layout => "feed_index" }# index.html.erb
      format.json { render json: @feeds }
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    @feed = Feed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feed }
    end
  end

  # GET /feeds/new
  # GET /feeds/new.json
  def new
    @feed = Feed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feed }
    end
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(params[:feed])

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render json: @feed, status: :created, location: @feed }
      else
        format.html { render action: "new" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.json
  def update
    @feed = Feed.find(params[:id])

    respond_to do |format|
      if @feed.update_attributes(params[:feed])
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end
end
