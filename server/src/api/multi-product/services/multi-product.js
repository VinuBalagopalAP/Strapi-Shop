'use strict';

/**
 * multi-product service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::multi-product.multi-product');
