const router = require('express').Router();
const { Category, Product } = require('../../models');

// The `/api/categories` endpoint

// Finds all categories and desplays them
router.get('/', (req, res) => {
  Category.findAll().then((categoryData) => {
    res.json(categoryData);
  });
});

// Finds a category by its id
router.get('/:id', async (req, res) => {
  Category.findByPk(req.params.id).then((categoryData) => {
    res.json(categoryData);
  });
});

// Creates new category from JSON input
router.post('/', async (req, res) => {
  Category.create(req.body)
    .then((newCategory) => {
      res.json(newCategory);
    })
    .catch((err) => {
      res.json(err);
    });
});

router.put('/:id', (req, res) => {
  Category.update(
    {
      category_name: req.body.category_name,
    },
    {
      where: {
        id: req.params.id,
      },
    }
  )
    .then((updatedCategory) => {
      res.json(updatedCategory);
    })
    .catch((err) => {
      console.log(err);
      res.json(err);
    });
});

router.delete('/:id', (req, res) => {
  // delete a category by its `id` value
  Category.destroy({
    where: {
      id: req.params.id,
    },
  })
    .then((deletedCategory) => {
      res.json(deletedCategory);
    })
    .catch((err) => res.json(err));
});

module.exports = router;
