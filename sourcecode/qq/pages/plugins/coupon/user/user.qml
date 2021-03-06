<!-- 导航 -->
<view class="nav-tabs">
  <block qq:for="{{nav_tabs_list}}" qq:key="item">
    <view class="nav-item cr-666 fl {{item.value == nav_tabs_value ? 'nav-item-active' : ''}}" data-index="{{index}}" data-value="{{item.value}}" bindtap="nav_tabs_event">{{item.name}}</view>
  </block>
</view>

<scroll-view scroll-y="{{true}}" class="scroll-box" lower-threshold="30">
  <!-- 优惠劵列表 -->
  <view qq:if="{{data_list != null}}" class="coupon-container">
    <!-- 未使用 -->
    <view qq:if="{{(data_list.not_use || null) != null && data_list.not_use.length > 0 && nav_tabs_value == 'not_use'}}">
      <block qq:for="{{data_list.not_use}}" qq:key="item">
        <view class="item spacing-mt bg-white" style="border:1px solid {{item.coupon.bg_color_value}};">
          <view class="v-left fl">
            <view class="base single-text" style="color:{{item.coupon.bg_color_value}};">
              <text qq:if="{{item.coupon.type == 0}}" class="symbol">{{price_symbol}}</text>
              <text class="price">{{item.coupon.discount_value}}</text>
              <text class="unit">{{item.coupon.type_unit}}</text>
              <text qq:if="{{(item.coupon.desc || null) != null}}" class="desc cr-888">{{item.coupon.desc}}</text>
            </view>
            <view qq:if="{{(item.coupon.use_limit_type_name || null) != null}}" class="base-tips cr-666 single-text">{{item.coupon.use_limit_type_name}}</view>
            <view class="base-time cr-888 single-text">{{item.time_start_text}} 至 {{item.time_end_text}}</view>
          </view>
          <navigator url="/pages/index/index" open-type="switchTab" hover-class="none">
            <view class="v-right fr" style="background:{{item.coupon.bg_color_value}};">
              <text class="circle"></text>
              <text>去使用</text>
            </view>
          </navigator>
        </view>
      </block>
    </view>

    <!-- 已使用 -->
    <view qq:if="{{(data_list.already_use || null) != null && data_list.already_use.length > 0 && nav_tabs_value == 'already_use'}}">
      <block qq:for="{{data_list.already_use}}" qq:key="item">
        <view class="item spacing-mt bg-white item-disabled">
          <view class="v-left fl">
            <view class="base single-text">
              <text qq:if="{{item.coupon.type == 0}}" class="symbol">{{price_symbol}}</text>
              <text class="price">{{item.coupon.discount_value}}</text>
              <text class="unit">{{item.coupon.type_unit}}</text>
              <text qq:if="{{(item.coupon.desc || null) != null}}" class="desc cr-888">{{item.coupon.desc}}</text>
            </view>
            <view qq:if="{{(item.coupon.use_limit_type_name || null) != null}}" class="base-tips cr-666 single-text">{{item.coupon.use_limit_type_name}}</view>
            <view class="base-time cr-888 single-text">使用 {{item.use_time_text}}</view>
          </view>
          <view class="v-right fr">
            <text class="circle"></text>
            <text>已使用</text>
          </view>
        </view>
      </block>
    </view>

    <!-- 已过期 -->
    <view qq:if="{{(data_list.already_expire || null) != null && data_list.already_expire.length > 0 && nav_tabs_value == 'already_expire'}}">
      <block qq:for="{{data_list.already_expire}}" qq:key="item">
        <view class="item spacing-mt bg-white item-disabled">
          <view class="v-left fl">
            <view class="base single-text">
              <text qq:if="{{item.coupon.type == 0}}" class="symbol">{{price_symbol}}</text>
              <text class="price">{{item.coupon.discount_value}}</text>
              <text class="unit">{{item.coupon.type_unit}}</text>
              <text qq:if="{{(item.coupon.desc || null) != null}}" class="desc cr-888">{{item.coupon.desc}}</text>
            </view>
            <view qq:if="{{(item.coupon.use_limit_type_name || null) != null}}" class="base-tips cr-666 single-text">{{item.coupon.use_limit_type_name}}</view>
            <view class="base-time cr-888 single-text">过期 {{item.time_end_text}}</view>
          </view>
          <view class="v-right fr">
            <text class="circle"></text>
            <text>已过期</text>
          </view>
        </view>
      </block>
    </view>
  </view>

  <view qq:if="{{data_list_loding_status != 3}}">
  <import src="/pages/common/nodata.qml" />
  <template is="nodata" data="{{status: data_list_loding_status, msg: data_list_loding_msg}}"></template>
</view>

<import src="/pages/common/bottom_line.qml" />
<template is="bottom_line" data="{{status: data_bottom_line_status}}"></template>
</scroll-view>